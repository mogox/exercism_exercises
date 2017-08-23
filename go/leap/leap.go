// Package leap has a function to check for leap years.
package leap

const testVersion = 3

// IsLeapYear checks if a given year matches the criteria for a leap year
// It is divisible by 4, except 100 unless is 400.
func IsLeapYear(year int) bool {
	return (year%4 == 0 && !(year%100 == 0 && year%400 != 0))
}
