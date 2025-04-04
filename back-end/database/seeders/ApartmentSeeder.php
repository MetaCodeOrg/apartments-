<?php

namespace Database\Seeders;

use App\Models\Apartment;
use App\Models\User;
use Illuminate\Database\Seeder;

class ApartmentSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::where('user_type', 'admin')->first();

        $apartments = [
            [
                'user_id' => $user->id,
                'title' => 'شقة فاخرة في وسط المدينة',
                'governorate' => 'القاهرة',
                'city' => 'مدينة نصر',
                'street' => 'شارع عباس العقاد',
                'price' => 1500000.00,
                'apartment_type' => 'Furnished',
                'long_description' => 'شقة فاخرة تتميز بموقع استراتيجي في قلب مدينة نصر، تتكون من 3 غرف نوم وصالة كبيرة ومطبخ حديث. تشطيب سوبر لوكس مع إطلالة رائعة.',
                'short_description' => 'شقة فاخرة 3 غرف وصالة',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home1.png', 'apartments/home2.png'],
                'rating' => 4.5
            ],
            [
                'user_id' => $user->id,
                'title' => 'دوبلكس فاخر في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'Furnished',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'دوبلكس في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'دوبلكس 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة حديثة في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'rent',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'شقة حديثة في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'شقة 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة مميزة في الإسكندرية',
                'governorate' => 'الإسكندرية',
                'city' => 'سموحة',
                'apartment_type' => 'rent',
                'street' => 'شارع فوزي معاذ',
                'price' => 1200000.00,
                'long_description' => 'شقة مميزة في سموحة، تتكون من غرفتين نوم وصالة ومطبخ مجهز. تشطيب حديث وموقع مميز قريب من النوادي والمولات.',
                'short_description' => 'شقة غرفتين في سموحة',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home3.png', 'apartments/home4.png'],
                'rating' => 4.3
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة فاخرة في الشيخ زايد',
                'governorate' => 'الجيزة',
                'city' => 'الشيخ زايد',
                'street' => 'الحي الثاني عشر',
                'apartment_type' => 'rent',
                'price' => 2500000.00,
                'long_description' => 'شقة فاخرة في كمبوند راقي بالشيخ زايد، تتكون من 3 غرف نوم وصالة كبيرة ومطبخ أمريكي. تشطيب سوبر لوكس مع حديقة خاصة.',
                'short_description' => 'شقة 3 غرف في كمبوند',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home4.png', 'apartments/home3.png'],
                'rating' => 4.9
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة اقتصادية في حلوان',
                'governorate' => 'القاهرة',
                'city' => 'حلوان',
                'apartment_type' => 'rent',
                'street' => 'شارع رياض',
                'price' => 800000.00,
                'long_description' => 'شقة اقتصادية في حلوان، تتكون من غرفتين وصالة ومطبخ. تشطيب جيد وموقع متميز قريب من المواصلات.',
                'short_description' => 'شقة غرفتين في حلوان',
                'images' => ['apartments/home1.png', 'apartments/home2.png'],
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'rating' => 4.5
            ],
            [
                'user_id' => $user->id,
                'title' => 'دوبلكس فاخر في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'Furnished',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'دوبلكس في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'دوبلكس 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة حديثة في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'rent',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'شقة حديثة في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'شقة 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة مميزة في الإسكندرية',
                'governorate' => 'الإسكندرية',
                'city' => 'سموحة',
                'apartment_type' => 'rent',
                'street' => 'شارع فوزي معاذ',
                'price' => 1200000.00,
                'long_description' => 'شقة مميزة في سموحة، تتكون من غرفتين نوم وصالة ومطبخ مجهز. تشطيب حديث وموقع مميز قريب من النوادي والمولات.',
                'short_description' => 'شقة غرفتين في سموحة',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home3.png', 'apartments/home4.png'],
                'rating' => 4.3
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة فاخرة في الشيخ زايد',
                'governorate' => 'الجيزة',
                'city' => 'الشيخ زايد',
                'street' => 'الحي الثاني عشر',
                'apartment_type' => 'rent',
                'price' => 2500000.00,
                'long_description' => 'شقة فاخرة في كمبوند راقي بالشيخ زايد، تتكون من 3 غرف نوم وصالة كبيرة ومطبخ أمريكي. تشطيب سوبر لوكس مع حديقة خاصة.',
                'short_description' => 'شقة 3 غرف في كمبوند',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home4.png', 'apartments/home3.png'],
                'rating' => 4.9
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة اقتصادية في حلوان',
                'governorate' => 'القاهرة',
                'city' => 'حلوان',
                'apartment_type' => 'rent',
                'street' => 'شارع رياض',
                'price' => 800000.00,
                'long_description' => 'شقة اقتصادية في حلوان، تتكون من غرفتين وصالة ومطبخ. تشطيب جيد وموقع متميز قريب من المواصلات.',
                'short_description' => 'شقة غرفتين في حلوان',
                'images' => ['apartments/home1.png', 'apartments/home2.png'],
                'features' => [
                    'غرف النوم: 4',
                    'حمامات: 3',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 250 متر مربع',
                    'مكيف هواء',
                    'مطبخ أمريكي',
                    'حمام سباحة',
                    'جيم'
                ],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'دوبلكس فاخر في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'Furnished',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'دوبلكس في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'دوبلكس 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة حديثة في المعادي',
                'governorate' => 'القاهرة',
                'city' => 'المعادي',
                'apartment_type' => 'rent',
                'street' => 'شارع 9',
                'price' => 2000000.00,
                'long_description' => 'شقة حديثة في المعادي، تشطيب راقي، تتكون من 4 غرف نوم وصالة كبيرة ومطبخ أمريكي. موقع متميز قريب من جميع الخدمات.',
                'short_description' => 'شقة 4 غرف في المعادي',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home2.png', 'apartments/home1.png'],
                'rating' => 4.8
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة مميزة في الإسكندرية',
                'governorate' => 'الإسكندرية',
                'city' => 'سموحة',
                'apartment_type' => 'rent',
                'street' => 'شارع فوزي معاذ',
                'price' => 1200000.00,
                'long_description' => 'شقة مميزة في سموحة، تتكون من غرفتين نوم وصالة ومطبخ مجهز. تشطيب حديث وموقع مميز قريب من النوادي والمولات.',
                'short_description' => 'شقة غرفتين في سموحة',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home3.png', 'apartments/home4.png'],
                'rating' => 4.3
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة فاخرة في الشيخ زايد',
                'governorate' => 'الجيزة',
                'city' => 'الشيخ زايد',
                'street' => 'الحي الثاني عشر',
                'apartment_type' => 'rent',
                'price' => 2500000.00,
                'long_description' => 'شقة فاخرة في كمبوند راقي بالشيخ زايد، تتكون من 3 غرف نوم وصالة كبيرة ومطبخ أمريكي. تشطيب سوبر لوكس مع حديقة خاصة.',
                'short_description' => 'شقة 3 غرف في كمبوند',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home4.png', 'apartments/home3.png'],
                'rating' => 4.9
            ],
            [
                'user_id' => $user->id,
                'title' => 'شقة اقتصادية في حلوان',
                'governorate' => 'القاهرة',
                'city' => 'حلوان',
                'apartment_type' => 'rent',
                'street' => 'شارع رياض',
                'price' => 800000.00,
                'long_description' => 'شقة اقتصادية في حلوان، تتكون من غرفتين وصالة ومطبخ. تشطيب جيد وموقع متميز قريب من المواصلات.',
                'short_description' => 'شقة غرفتين في حلوان',
                'features' => [
                    'غرف النوم: 3',
                    'حمامات: 2',
                    'موقف سيارات',
                    'انترنت',
                    'حراسة أمنية',
                    'مساحة: 180 متر مربع',
                    'مكيف هواء',
                    'مطبخ مجهز'
                ],
                'images' => ['apartments/home1.png', 'apartments/home2.png'],
                'rating' => 4.0
            ]
        ];

        foreach ($apartments as $apartment) {
            Apartment::create($apartment);
        }
    }
}
