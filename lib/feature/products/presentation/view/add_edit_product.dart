import 'package:flutter/material.dart';
import 'package:products/core/domain/entities/products_model.dart';
import 'package:products/core/resources/color_app.dart';
import 'package:products/core/theme/theme.dart';
import 'package:products/core/widgets/custom_scaffold.dart';
import 'package:products/core/widgets/fill_buttom.dart';
import 'package:products/feature/products/presentation/providers/product_notifier.dart';
import 'package:products/feature/products/presentation/widget/add_edit/form.dart';
import 'package:provider/provider.dart';

class AddEditProduct extends StatefulWidget {
  const AddEditProduct({super.key, required this.product});

  final ProductModel? product;

  @override
  State<AddEditProduct> createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  bool isEdit = false;
  bool isInputChange = false;
  ProductModel? product;

  @override
  void initState() {
    product = context.read<ProductProvider>().product;

    if (widget.product != null && widget.product?.id != null) {
      isEdit = true;
    }
    super.initState();
  }

  void _createUpdate(BuildContext context) {
    FocusScope.of(context).unfocus();

    final keyState = context.read<ProductProvider>().formKey;

    keyState.currentState!.save();

    if (keyState.currentState!.validate()) {
      if (isEdit) {
        context.read<ProductProvider>().updateProduct();
      } else {
        context.read<ProductProvider>().createProduct();
      }
    }
  }

  changeInput() {
    setState(() {
      isInputChange = true;
    });
  }

  changeInputRevers() {
    setState(() {
      isInputChange = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(alignment: Alignment.centerLeft, child: BackButton()),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Text(
                isEdit ? 'Actualizar Producto' : 'Registro de Producto',
                style: AppTheme.theme.textTheme.titleLarge?.copyWith(),
              ),
            ),
            const SizedBox(height: 50),
            CustomForm(
              isEdit: isEdit,
              changeInputRevers: () => changeInputRevers(),
              changeInput: () => changeInput(),
            ),
            const SizedBox(height: 50),
            if (isInputChange)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: FillButton(
                    shape: 20,
                    padding: 11,
                    backgroundColor:
                        isEdit ? ColorApp.normal : ColorApp.success,
                    onPressed: () => _createUpdate(context),
                    label: isEdit ? 'Actualizar' : 'Guardar',
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
