class BinSample
  attr_reader :size, :success_rate

  def initialize(size, success_rate)
    @size = size
    @success_rate = success_rate / 100.0
  end

  def inverse_size
    1.0 / size
  end
end

def compare_samples(sample1, sample2)
  numerator = sample1.success_rate - sample2.success_rate
  coefficient = comparison_coefficient(sample1, sample2)
  denominator = Math.sqrt(
    coefficient *
    (1 - coefficient) *
    (sample1.inverse_size +
    sample2.inverse_size))
  numerator / denominator
end

def comparison_coefficient(sample1, sample2)
  numerator = comparison_numerator(sample1) + comparison_numerator(sample2)
  denominator = sample1.size + sample2.size
  numerator / denominator
end

def comparison_numerator(sample)
  sample.size * sample.success_rate
end
