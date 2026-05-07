import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(onChanged: (value) {}),
              SizedBox(height: 16),
              ImageField(onFileChanged: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
