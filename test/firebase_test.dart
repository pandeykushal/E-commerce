// // Import necessary packages
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:np_com_pandeykushal/view_model/export_view_model.dart';
// import 'provider_test.mocks.dart';

// // Annotation to generate mock classes
// @GenerateMocks([
//   FirebaseFirestore,
//   CollectionReference,
//   QuerySnapshot,
//   QueryDocumentSnapshot
// ])
// void main() {
//   group('fetchProduct', () {
//     // Create the mock instances
//     final mockFirestore = MockFirebaseFirestore();
//     final mockCollectionReference = MockCollectionReference();
//     final mockQuerySnapshot = MockQuerySnapshot();
//     final mockDocumentSnapshot = MockQueryDocumentSnapshot();

//     // Create an instance of your provider
//     final provider = HomeProvider();

//     setUp(() {
//       // Mock Firestore instance
//       when(mockFirestore.collection(any)).thenReturn(mockCollectionReference);
//       // Mock the query snapshot
//       when(mockCollectionReference.get())
//           .thenAnswer((_) async => mockQuerySnapshot);
//       // Mock the document snapshot data
//       when(mockDocumentSnapshot.data()).thenReturn({
//         'id': '1',
//         'name': 'Test Product',
//         'price': 100,
//       });
//       // Mock the documents list in the query snapshot
//       when(mockQuerySnapshot.docs).thenReturn([mockDocumentSnapshot]);
//     });

//     test('fetchProduct sets product list correctly', () async {
//       // Assign the mocked Firestore instance to your provider
//       provider.firestore = mockFirestore;

//       // Call the fetchProduct method
//       await provider.fetchProduct();

//       // Verify that the product list is set correctly
//       expect(provider.product.length, 1);
//       expect(provider.product.first.name, 'Test Product');
//       expect(provider.isLoadingProduct, false);
//     });

//     test('fetchProduct handles errors correctly', () async {
//       // Mock an error during the Firestore call
//       when(mockCollectionReference.get())
//           .thenThrow(Exception('Firestore error'));

//       // Call the fetchProduct method
//       await provider.fetchProduct();

//       // Verify that the product list is empty and the loading state is false
//       expect(provider.product.isEmpty, true);
//       expect(provider.isLoadingProduct, false);
//     });
//   });
// }
