import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';


class NewPasswordSucceedState extends State<NewPasswordSucceed> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea(
				child: Container(
					constraints: const BoxConstraints.expand(),
					color: Color(0xFFFFFFFF),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Expanded(
								child: Container(
									color: Color(0xFFF9FAFB),
									width: double.infinity,
									height: double.infinity,
									child: SingleChildScrollView(
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												IntrinsicHeight(
													child: Container(
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(47),
															color: Color(0xFF706D6D),
														),
														padding: const EdgeInsets.only( top: 83),
														width: double.infinity,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																Container(
																	margin: const EdgeInsets.only( bottom: 91, left: 20, right: 20),
																	width: double.infinity,
																	child: Text(
																		"Buat ulang kata sandi",
																		style: TextStyle(
																			color: Color(0xFF000000),
																			fontSize: 40,
																			fontWeight: FontWeight.bold,
																		),
																	),
																),
																Container(
																	margin: const EdgeInsets.only( bottom: 6, left: 21),
																	child: Text(
																		"Kata sandi baru",
																		style: TextStyle(
																			color: Color(0xFF262626),
																			fontSize: 20,
																			fontWeight: FontWeight.bold,
																		),
																	),
																),
																IntrinsicHeight(
																	child: Container(
																		width: double.infinity,
																		child: Column(
																			crossAxisAlignment: CrossAxisAlignment.start,
																			children: [
																				IntrinsicHeight(
																					child: Container(
																						decoration: BoxDecoration(
																							border: Border.all(
																								color: Color(0xFFD9D9D9),
																								width: 1,
																							),
																							borderRadius: BorderRadius.circular(11),
																							color: Color(0xFFFFFFFF),
																						),
																						padding: const EdgeInsets.only( top: 1, bottom: 34),
																						margin: const EdgeInsets.symmetric(horizontal: 21),
																						width: double.infinity,
																						child: Column(
																							crossAxisAlignment: CrossAxisAlignment.start,
																							children: [
																								Container(
																									margin: const EdgeInsets.only( left: 158),
																									width: 17,
																									height: 17,
																									child: Image.network(
																										"https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/2cb8y5o2_expires_30_days.png",
																										fit: BoxFit.fill,
																									)
																								),
																							]
																						),
																					),
																				),
																				IntrinsicHeight(
																					child: Container(
																						decoration: BoxDecoration(
																							borderRadius: BorderRadius.circular(47),
																							color: Color(0xFFFFFFFF),
																						),
																						padding: const EdgeInsets.only( top: 8, bottom: 110, left: 57, right: 57),
																						width: double.infinity,
																						child: Column(
																							children: [
																								Container(
																									decoration: BoxDecoration(
																										borderRadius: BorderRadius.circular(5),
																										color: Color(0xFFD9D9D9),
																									),
																									margin: const EdgeInsets.only( bottom: 23),
																									width: 157,
																									height: 6,
																									child: SizedBox(),
																								),
																								IntrinsicWidth(
																									child: IntrinsicHeight(
																										child: Container(
																											margin: const EdgeInsets.only( bottom: 27),
																											child: Column(
																												crossAxisAlignment: CrossAxisAlignment.start,
																												children: [
																													IntrinsicWidth(
																														child: IntrinsicHeight(
																															child: Container(
																																margin: const EdgeInsets.only( bottom: 37, left: 8),
																																child: Stack(
																																	clipBehavior: Clip.none,
																																	children: [
																																		Column(
																																			crossAxisAlignment: CrossAxisAlignment.start,
																																			children: [
																																				Container(
																																					width: 244,
																																					height: 203,
																																					child: Image.network(
																																						"https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/kri5ajtx_expires_30_days.png",
																																						fit: BoxFit.fill,
																																					)
																																				),
																																			]
																																		),
																																		Positioned(
																																			bottom: 0,
																																			left: 0,
																																			width: 279,
																																			child: IntrinsicHeight(
																																				child: Container(
																																					decoration: BoxDecoration(
																																						borderRadius: BorderRadius.circular(25),
																																						color: Color(0xFFE6303B),
																																					),
																																					transform: Matrix4.translationValues(-2, 41, 0),
																																					width: 279,
																																				),
																																			),
																																		),
																																	]
																																),
																															),
																														),
																													),
																													Text(
																														"Kata sandi berhasil diubah",
																														style: TextStyle(
																															color: Color(0xFF000000),
																															fontSize: 20,
																															fontWeight: FontWeight.bold,
																														),
																													),
																												]
																											),
																										),
																									),
																								),
																								Container(
																									width: 272,
																									child: Text(
																										"Kata sandi berhasil diubah, Anda dapat masuk kembali dengan kata sandi baru.",
																										style: TextStyle(
																											color: Color(0xFF706D6D),
																											fontSize: 12,
																											fontWeight: FontWeight.bold,
																										),
																										textAlign: TextAlign.center,
																									),
																								),
																							]
																						),
																					),
																				),
																			]
																		),
																	),
																),
															]
														),
													),
												),
											],
										)
									),
								),
							),
						],
					),
				),
			),
		);
	}
}