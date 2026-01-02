@IsTest
private class FitnessTestCopilot {
    @IsTest
    static void testCalculateBMI_valid() {
        // weight 70 kg, height 1.75 m => BMI ~= 22.8571
        Fitness f = new Fitness(70, 1.75, 10, 50);
        Decimal result = f.calculateBMI();
        Decimal expected = 70 / (1.75 * 1.75);
        Decimal r = result.setScale(4, System.RoundingMode.HALF_UP);
        Decimal e = expected.setScale(4, System.RoundingMode.HALF_UP);
        System.assertEquals(
            e,
            r,
            'BMI should match expected value rounded to 4 decimals'
        );
    }

    @IsTest
    static void testCalculateBMI_invalidInputs() {
        // weight <= 0
        Fitness f1 = new Fitness(0, 1.75, 0, 0);
        System.assertEquals(0, f1.calculateBMI());

        Fitness f2 = new Fitness(-5, 1.75, 0, 0);
        System.assertEquals(0, f2.calculateBMI());

        // height <= 0 or null
        Fitness f3 = new Fitness(70, 0, 0, 0);
        System.assertEquals(0, f3.calculateBMI());

        Fitness f4 = new Fitness(70, null, 0, 0);
        System.assertEquals(0, f4.calculateBMI());
    }

    @IsTest
    static void testCalculatePace_valid() {
        // distance 10 km, minutes 50 => speed = 10 / (50/60) = 12 km/h
        Fitness f = new Fitness(70, 1.75, 10, 50);
        Decimal result = f.calculatePace();
        Decimal expected = 10 / (50 / 60);
        Decimal r = result.setScale(4, System.RoundingMode.HALF_UP);
        Decimal e = expected.setScale(4, System.RoundingMode.HALF_UP);
        System.assertEquals(
            e,
            r,
            'Pace (speed) should match expected value rounded to 4 decimals'
        );
    }

    @IsTest
    static void testCalculatePace_invalidInputs() {
        Fitness f1 = new Fitness(70, 1.75, 0, 50);
        System.assertEquals(0.0, f1.calculatePace());

        Fitness f2 = new Fitness(70, 1.75, 10, 0);
        System.assertEquals(0.0, f2.calculatePace());

        Fitness f3 = new Fitness(70, 1.75, -1, 30);
        System.assertEquals(0.0, f3.calculatePace());
    }
}
