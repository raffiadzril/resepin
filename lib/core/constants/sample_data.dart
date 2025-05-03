import 'package:resepin/core/constants/recipe_model.dart';

class SampleData {
  static Recipe getRendangRecipe() {
    return Recipe(
      id: '1',
      title: 'Rendang Lebaran',
      description:
          'Rendang daging sapi khas Padang dengan rempah-rempah yang kaya dan santan kelapa yang kental. Hidangan ini sangat cocok untuk disajikan saat Lebaran bersama keluarga. Rendang ini memiliki cita rasa yang mendalam karena proses memasaknya yang lama, sehingga bumbu meresap sempurna ke dalam daging. Tekstur daging yang empuk dan aroma rempah yang menggugah selera menjadikan rendang sebagai salah satu hidangan terbaik di dunia. Cocok disajikan dengan nasi hangat, ketupat, atau lontong, rendang ini akan menjadi favorit semua orang di meja makan Anda.',
      imageUrl: 'images/home/rendangLebaran.png',
      rating: 4.7,
      prepTime: 60, // in minutes
      cookTime: 420, // in minutes
      totalTime: 480, // in minutes
      servings: 4,
      ingredients: [
        Ingredient(name: 'Daging sapi', quantity: 2, unit: 'kg'),
        Ingredient(name: 'Santan kental', quantity: 1, unit: 'liter'),
        Ingredient(name: 'Cabai merah', quantity: 250, unit: 'gram'),
        Ingredient(name: 'Bawang merah', quantity: 200, unit: 'gram'),
        Ingredient(name: 'Bawang putih', quantity: 100, unit: 'gram'),
        Ingredient(name: 'Jahe', quantity: 50, unit: 'gram'),
        Ingredient(name: 'Lengkuas', quantity: 100, unit: 'gram'),
        Ingredient(name: 'Serai', quantity: 3, unit: 'batang'),
        Ingredient(name: 'Daun jeruk', quantity: 5, unit: 'lembar'),
        Ingredient(name: 'Daun kunyit', quantity: 2, unit: 'lembar'),
        Ingredient(name: 'Asam kandis', quantity: 2, unit: 'buah'),
        Ingredient(name: 'Garam', quantity: 2, unit: 'sendok teh'),
      ],
      steps: [
        CookingStep(
          number: 1,
          instruction:
              'Haluskan cabai merah, bawang merah, bawang putih, jahe, dan lengkuas hingga benar-benar halus.',
          tip:
              'Gunakan blender atau food processor untuk hasil yang lebih halus dan cepat.',
        ),
        CookingStep(
          number: 2,
          instruction:
              'Potong daging sapi menjadi potongan berukuran sedang, sekitar 5x5 cm. Pastikan ketebalan daging merata agar matang secara merata.',
        ),
        CookingStep(
          number: 3,
          instruction:
              'Panaskan minyak dalam wajan besar. Tumis bumbu halus, serai, daun jeruk, dan daun kunyit hingga harum dan matang, sekitar 5-7 menit.',
          tip:
              'Tumis dengan api sedang agar bumbu tidak gosong dan aromanya keluar maksimal.',
        ),
        CookingStep(
          number: 4,
          instruction:
              'Masukkan daging sapi, aduk rata dengan bumbu. Masak hingga daging berubah warna di semua sisi, sekitar 10 menit.',
        ),
        CookingStep(
          number: 5,
          instruction:
              'Tuangkan santan kental, tambahkan asam kandis dan garam. Aduk rata dan masak dengan api kecil. Biarkan mendidih perlahan sambil sesekali diaduk agar santan tidak pecah.',
          tip:
              'Proses memasak rendang membutuhkan waktu yang lama. Pastikan api kecil dan sesekali diaduk agar tidak gosong di bagian bawah.',
        ),
      ],
      reviews: [
        Review(
          userName: 'Nanang Apriyadi',
          userImage: 'images/users/user1.png',
          date: '12 April 2023',
          rating: 5.0,
          comment:
              'Saya menyukai resep rendang ini hasilnya sangat lezat meskipun membutuhkan waktu yang lama untuk memasaknya. Rempahnya sangat terasa!',
        ),
        Review(
          userName: 'Nanang Apriyadi',
          userImage: 'images/users/user1.png',
          date: '12 April 2023',
          rating: 5.0,
          comment:
              'Saya menyukai resep rendang ini hasilnya sangat lezat meskipun membutuhkan waktu yang lama untuk memasaknya. Rempahnya sangat terasa!',
        ),
        Review(
          userName: 'Nanang Apriyadi',
          userImage: 'images/users/user1.png',
          date: '12 April 2023',
          rating: 4.0,
          comment:
              'Saya menyukai resep rendang ini hasilnya sangat lezat meskipun membutuhkan waktu yang lama untuk memasaknya. Rempahnya sangat terasa!',
        ),
      ],
      chef: Chef(
        name: 'Levi Ackerman',
        image: 'images/chefs/chef1.png',
        title: 'Penggiat',
        recipeCount: 98,
      ),
    );
  }
}
