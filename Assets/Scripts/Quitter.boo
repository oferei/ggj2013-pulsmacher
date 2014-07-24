import UnityEngine

class Quitter (MonoBehaviour): 

	def Update ():
		if Input.GetKeyDown(KeyCode.Escape):
			Application.Quit()
