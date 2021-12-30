using System.ServiceModel;

namespace Average3DartScore.Models
{
    [ServiceContract]
    public interface IAverage3Dart
    {
        [OperationContract]
        public double getAverage3DartScore(double prevAvg, int amountDarts, int thrownScore);
    }
}
