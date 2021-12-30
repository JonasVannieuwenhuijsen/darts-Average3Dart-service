namespace Average3DartScore.Models
{
    public class Average3Dart : IAverage3Dart
    {
        public double getAverage3DartScore(double prevAvg, int amountDarts, int thrownScore)
        {
            return ((prevAvg * (amountDarts / 3)) + thrownScore) / ((amountDarts + 3) / 3);
        }
    }
}
