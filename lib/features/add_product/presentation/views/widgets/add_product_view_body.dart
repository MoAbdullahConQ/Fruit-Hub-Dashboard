import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationsMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) {
                  expirationsMonths = num.parse(value!);
                },
                hintText: 'Expiration (Months)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: 'Number of Calories',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: 'Unit Amount (grams)',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 8),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationsMonths: expirationsMonths.toInt(),
                        isOrganic: isOrganic,
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        reviews: [],
                      );

                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Please Select an Image')));
  }
}
