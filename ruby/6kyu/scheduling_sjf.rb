=begin
Scheduling (Shortest Job First SJF)

(Level 6 Kata)

Scheduling is how the processor decides which jobs(processes) get to use the processor and for how long.
This can cause a lot of problems. Like a really long process taking the entire CPU and freezing all the
other processes. One solution is Shortest Job First(SJF), which today you will be implementing.

SJF works by, well, letting the shortest jobs take the CPU first. If the jobs are the same size then it
is First In First Out (FIFO). The idea is that the shorter jobs will finish quicker, so theoretically
jobs won't get frozen because of large jobs. (In practice they're frozen because of small jobs).

You will be implementing:

  def SJF(jobs, index)
It takes in:

"jobs" a non-empty array of positive integers. They represent the clock-cycles(cc) needed to finish the job.
"index" a positive integer. That represents the job we're interested in.
SJF returns:

A positive integer representing the cc it takes to complete the job at index.
Here's an example:

SJF([3, 10, 20, 1, 2], 0)
at 0cc [3, 10, 20, 1, 2] jobs[3] starts
at 1cc [3, 10, 20, 0, 2] jobs[3] finishes, jobs[4] starts
at 3cc [3, 10, 20, 0, 0] jobs[4] finishes, jobs[0] starts
at 6cc [0, 10, 20, 0, 0] jobs[0] finishes
so:

SJF([3,10,20,1,2], 0) == 6

I: an array of positive integers, all elements > 0
   will be non emmpty
   each integer represents the time length required for a job
O: a number representing the cc it takes to complete the job
AL:
  - map the original array to an array of arrays where each subarray
  is [element, index]
  - now sort this new array based on the first element of each subarray
  - example say we have input to SJF as ([3,10,10,20,1,2,10], 6)
  new sorted array will be [[1, 4],[2, 5],[3, 0],[10,1], [10, 2], [10, 6], [20, 3]]
  - now find a last index, in this case find the index in the sorted array where second element = 6
  - in this case the desired index would be 5
  - map the sorted array to an array of single elements by taking the sorted array of arrays and only
  taking the first element now array will be [1, 2, 3, 10, 10, 10, 20]
  - now slice this array [0..desired index]
  - reduce this array
=end

=begin
input: an array of integers, from zero and greater, representing clock-cycles
        (cc) for a given task
      
      an integer (0 or greater), representing the index of the task we're
      interested in.

output: an integer, representing the number of clock cycles needed to
        complete the task we're interested in.

rule: if the clock cycles for two task are the same Firs in First out
      meaning the task with the smallest index first.

notes:
- I have somehow to keep an eye on the task at given index
 while I'm selecting the smallest integer from the array
  and moving it into another (empty) array
- Find numbers either: smaller than integer at given_index
-              or : equal to integer at given_index but their index smaller
              All these numbers must be selected and pushed into a new arr
algorithm:
 - select integers in the array smaller than integer at given_index
 - select integers in the array equal to integer at given_index
   with index < than given_index
 - sum those numbers
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SchedulingSjfMyFirstSolution < Minitest::Test

  def SJF(jobs, index)
    number = jobs[index]
    jobs.select.with_index do |job, idx|
      (job < number) || (job == number && idx <= index)
    end.reduce(&:+)
  end

  def test_1
    # skip
    assert_equal(100, SJF([100], 0))
  end
  
  def test_2
    # skip
    assert_equal(6, SJF([3,10,20,1,2], 0))
  end
  
  def test_3
    # skip
    assert_equal(16, SJF([3,10,20,1,2], 1))
  end
  
  def test_4
    # skip
    assert_equal(36, SJF([3,10,10,20,1,2,10], 6))
  end
  
  def test_5
    # skip
    assert_equal(46, SJF([3,10,10,20,1,2,10,10,20,10,30], 7))
  end
  
end