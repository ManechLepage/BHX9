extends Control
var stage:=0


func email_done():
	if stage == 0:
		stage = max(stage,1)
		$Tuto1Mail.hide()
		$Tuto2Invest.show()
	
func invest_done():
	if stage == 1:
		stage = max(stage,2)
		$Tuto2Invest.hide()	
		$Tuto2Invest2.show()

func invest2_done():
	if stage == 2:
		$"../Investigation".frozen = true
		stage = max(stage, 3)
		$Tuto2Invest2.hide()
		$Tuto4truth.show()
	
func truth_done():
	if stage == 3:
		stage = max(stage,4)
		$Tuto4truth.hide()
		$Tuto5link.show()

func link_done():
	$"../Investigation".frozen = false
	if stage == 4:
		stage = max(stage,5)
		$Tuto5link.hide()
	
