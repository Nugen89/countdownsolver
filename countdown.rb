class Countdown

  BIG_NUMS = [100, 75, 50, 25]
  SMALL_NUMS = (1..10)
  OPS = ["*", "/", "+", "-"]

  attr_accessor :target, :numbers, :equation, :best_diff, :best_method

  def initialize(target_num = nil)
    target_num ? @target = target_num : @target = (100..999).to_a.sample
    @numbers = [] << BIG_NUMS.to_a.sample
    5.times { |n| @numbers << SMALL_NUMS.to_a.sample }
  end

  def find_combination
    @numbers.permutation.to_a.each do |perm|

      perm.each_with_index do |val, i|
        left_com = perm[0..i]
        right_com = perm[(i+1)..-1]

        # puts "==========="
        # puts "#{left_com.inspect} | #{right_com.inspect}"
        # puts "==========="

        left_ops_com = ["+","-","/","*"].permutation(left_com.length-1).to_a

        left_ops_com.each do |op_com|
          left_operation = left_com.zip(op_com).flatten.compact
          right_ops_com = ["+","-","/","*"].permutation(right_com.length-1).to_a

          right_ops_com.each do |op_com|
            right_operation = right_com.zip(op_com).flatten.compact
            OPS.each do |op|
              unless eval(right_operation.join) == 0
                total = eval(left_operation.join).send(op, eval(right_operation.join)) 
                puts "MATCH FOUND = #{total}" if ((@target - total) == 0)
                puts "#{left_operation} #{op} #{right_operation}" if ((@target - total) == 0)
                return total if ((@target - total) == 0)
              end
            end
          end

          if right_ops_com.empty?
            total = eval(left_operation.join)
            puts "MATCH FOUND = #{total}" if ((@target - total) == 0)
            puts "#{left_operation}" if ((@target - total) == 0)
            return total if ((@target - total) == 0)
          end

        end
      end
    end
  end

end

# .min_by { |x| (x.to_f - target).abs }
# (1..4).to_a.permutation.to_a
# (1..10).to_a.combination(2).map{|i,j| arr[i...j]}
