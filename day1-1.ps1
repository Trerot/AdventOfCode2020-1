$puzzle = get-puzzleinput -day 1 -year 2020
$puzzlearray = new-object -typename System.Collections.ArrayList
$puzzle.split().foreach({ $puzzlearray.add([int]$_) })
$result = new-object -typename System.Collections.ArrayList
$puzzlearray.foreach({
        $numA = $_
        $numB = 2020 - $_
        if ($puzzlearray.contains([int]$numB)) {
            $result.add(
                [PSCustomObject]@{
                    numA = $($numA)
                    numB = $($numB)
                })
        }
    })
$answer = $result[0].numA * $result[0].numB

# day one part two
# three numbers that add up to 2020

$result2 = new-object -typename System.Collections.ArrayList
$puzzlearray.foreach({
        $numA = $_
        $puzzlearray.ForEach({
                $numB = 90000
                if($_ -ne $numA){
                    $numB = $_
                }
                $numC = 2020 - ($numA + $numB)

                if ($puzzlearray.contains([int]$numC)) {
                    $result2.add(
                        [PSCustomObject]@{
                            numA = $($numA)
                            numB = $($numB)
                            numC = $($numC)

                        }
                    )
                }
            })
        })
        $resultNotNull = $result2.Where({$_.numA -ne 0 -and $_.numb -ne 0 -and $_.numc -ne 0})

$answer = $resultNotNull[0].numA * $resultNotNull[0].numB * $resultNotNull[0].numC