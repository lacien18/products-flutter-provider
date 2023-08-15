import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/domain/entities/type_feed.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/utils/dialog_manager.dart';
import 'package:products/core/utils/validators.dart';
import 'package:products/core/utils/white_space_text_input_formatter.dart';
import 'package:products/core/widgets/form_fields/decorated_text_form_field.dart';
import 'package:products/di/locator.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:provider/provider.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    this.changeInput,
    this.isEdit = false,
    this.changeInputRevers,
  });

  final bool isEdit;

  final VoidCallback? changeInput;
  final VoidCallback? changeInputRevers;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  int stock = 0;
  ProductModel? product;
  TextEditingController tName = TextEditingController();
  TextEditingController tDescription = TextEditingController();
  TextEditingController tPrice = TextEditingController();

  @override
  void initState() {
    product = context.read<ProductProvider>().product;

    if (widget.isEdit) {
      tName.text = product!.name!;
      tDescription.text = product!.description!;
      tPrice.text = product!.price.toString();

      stock = product!.stock!;
      context.read<ProductProvider>().product.id = product!.id;
    }
    context.read<ProductProvider>().addListener(changeState);
    super.initState();
  }

  @override
  void dispose() {
    sl<ProductProvider>().removeListener(changeState);
    sl<ProductProvider>().dispose();

    super.dispose();
  }

  void changeState() {
    if (mounted) {
      context.read<ProductProvider>().state.maybeWhen(
          loading: (l) {
            DialogManager.showMyDialog(context);
          },
          failure: (f) {
            GoRouter.of(context).pop();
            DialogManager.snackBar(
              context,
              SnackBarType.error,
              message: f.message,
            );
          },
          success: (s, f) {

            widget.changeInputRevers!();
            
            GoRouter.of(context).pop();
            if (f == TypeFeed.updateProduct) {
              if (widget.isEdit) {
                DialogManager.snackBar(
                  context,
                  SnackBarType.success,
                  message: 'Producto actualizado exitosamente',
                );
              }
            }
            if (f == TypeFeed.createProduct) {
              tDescription.clear();
              tName.clear();
              tPrice.clear();
              stock = 0;
              DialogManager.snackBar(
                context,
                SnackBarType.success,
                message: 'Producto agregado exitosamente',
              );
            }
          },
          orElse: () {});
    }
  }

  upStock() {
    widget.changeInput!();
    setState(() {
      stock++;
    });
  }

  downStock() {
    widget.changeInput!();
    setState(() {
      if (stock > 0) {
        stock--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Form(
      key: productProvider.formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Nombre del producto',
              style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 10),
            DecoratedTextFormField(
              controller: tName,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                productProvider.product.name = value;
                widget.changeInput!();
              },
              inputFormatters: [WhiteSpaceTextInputFormatter()],
              validator: validateWith(TextFormFieldValidator()),
            ),
            const SizedBox(height: 10),
            Text(
              'Descripcion',
              style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 10),
            DecoratedTextFormField(
              maxLines: 8,
              controller: tDescription,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                productProvider.product.description = value;
                widget.changeInput!();
              },
              inputFormatters: [WhiteSpaceTextInputFormatter()],
              validator: validateWith(TextFormFieldValidator()),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Precio',
                        style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
                      ),
                      const SizedBox(height: 10),
                      DecoratedTextFormField(
                        controller: tPrice,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          productProvider.product.price = int.parse(value!);
                          widget.changeInput!();
                        },
                        inputFormatters: [WhiteSpaceTextInputFormatter()],
                        validator: validateWith(NumericFormFieldValidator()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Stock',
                      style: AppTheme.theme.textTheme.bodyMedium?.copyWith(),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            upStock();
                            productProvider.product.stock = stock;
                          },
                          icon: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 30,
                          child: Text(
                            stock.toString(),
                            style:
                                AppTheme.theme.textTheme.bodyMedium?.copyWith(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            downStock();
                            productProvider.product.stock = stock;
                          },
                          icon: const Icon(Icons.remove),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
