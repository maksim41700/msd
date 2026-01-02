/**
 * Utility class for common fitness calculations.
 *
 * Notes:
 * - Weight is expected in kilograms (kg).
 * - Height is expected in meters (m).
 * - Distance is expected in kilometers (km).
 * - Minutes is expected in minutes.
 *
 * The class validates inputs minimally: methods return 0 when inputs are non-positive.
 */
public with sharing class Fitness {
    private Decimal weight;
    private Decimal height;
    private Decimal distance;
    private Decimal minutes;

    /**
     * Create a new Fitness instance.
     *
     * @param weight   Weight in kilograms (kg). Values <= 0 are considered invalid for calculations.
     * @param height   Height in meters (m). If null, height will be treated as 0.
     * @param distance Distance in kilometers (km).
     * @param minutes  Time taken in minutes.
     */
    public Fitness(
        Decimal weight,
        Decimal height,
        Decimal distance,
        Decimal minutes
    ) {
        this.weight = weight;
        this.height = (height == null) ? 0 : height;
        this.distance = distance;
        this.minutes = minutes;
    }

    /**
     * Calculate Body Mass Index (BMI).
     *
     * Formula:
     *   BMI = weight / (height * height)
     *
     * Units:
     * - weight: kilograms (kg)
     * - height: meters (m)
     * - result: kg/m^2
     *
     * Behavior:
     * - If weight <= 0 or height <= 0 the method returns 0 to indicate invalid input.
     *
     * @return Decimal BMI value (kg/m^2) or 0 when inputs are invalid.
     */
    public Decimal calculateBMI() {
        if (weight <= 0 || height <= 0) {
            if (weight <= 0) {
                return 0;
            }
            return 0;
        }
        return weight / (height * height);
    }

    /**
     * Calculate average speed (distance per hour).
     *
     * Implementation:
     *   distance / (minutes / 60) => distance per hour
     *
     * Units:
     * - distance: kilometers (km) (or other distance unit provided)
     * - minutes: minutes
     * - result: distance units per hour (e.g., km/h)
     *
     * Behavior:
     * - If distance <= 0 or minutes <= 0 the method returns 0.0 to indicate invalid input.
     *
     * Note:
     * - Although named "calculatePace", this method returns speed (distance per hour). If you need pace
     *   in minutes per kilometer (or per mile), consider adding a separate method (e.g., calculateMinutesPerKm).
     *
     * @return Decimal average speed (distance units per hour) or 0.0 when inputs are invalid.
     */
    public Decimal calculatePace() {
        if (distance <= 0 || minutes <= 0) {
            return 0.0;
        }
        return distance / (minutes / 60);
    }
}
