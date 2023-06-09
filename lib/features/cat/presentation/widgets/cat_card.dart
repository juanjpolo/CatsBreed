import 'package:cleararchitecture/core/strings/texts.dart';
import 'package:cleararchitecture/features/cat/domain/entities/Cat.dart';
import 'package:cleararchitecture/features/cat/presentation/pages/CatPageDetail.dart';
import 'package:flutter/material.dart';

import '../../../../core/strings/failures_strings.dart';

class CatWidget extends StatelessWidget {
  final Cats cat;

  const CatWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 20,
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 5, bottom: 3),
                  child: Text(
                    'Raza: ${cat.name}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 5, bottom: 3),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatPageDetail(
                                  cat: cat,
                                )),
                      );
                    },
                    child: const Text(
                      'See more...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  cat.referenceImageId ?? '',
                  errorBuilder: (context, error, stackTrace) {
                return const Text(ERROR_IMAGE_NETWORK);
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 5, bottom: 8),
                  child: Text(
                    '$ORIGIN: ${cat.origin}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 5, bottom: 8),
                  child: Text(
                    '$INTELLIGENCE: ${cat.intelligence}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
