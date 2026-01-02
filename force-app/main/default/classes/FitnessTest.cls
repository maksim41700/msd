@isTest
public class FitnessTest {
    private static Fitness fitness = new Fitness(100, 2, 10, 60);
    private static Fitness negativeFitness = new Fitness(100, -2, 10, -60);

    @isTest
    static void calculateBMITest() {
        Decimal bMI = fitness.calculateBMI();
        // System.assertEquals(25.0, bMI, 'Incorrect BMI');
        Assert.areEqual(25.0, bMI, 'Incorrect BMI');
    }

    @isTest
    static void calculateBMINegativeTest() {
        Decimal bMI = negativeFitness.calculateBMI();
        // System.assertEquals(0.0, bMI, 'Incorrect BMI');
        Assert.isTrue(0.0 == bMI, 'Incorrect BMI');
    }

    @isTest
    static void calculatePaceTest() {
        Decimal pace = fitness.calculatePace();
        // System.assertEquals(10.0, pace, 'Incorrect Pace');
        Assert.areEqual(10.0, pace, 'Incorrect Pace');
    }

    @isTest
    static void calculatePaceNegativeTest() {
        Decimal pace = negativeFitness.calculatePace();
        // System.assertEquals(0.0, pace, 'Incorrect Pace');
        Assert.areEqual(0.0, pace, 'Incorrect Pace');
    }
}
