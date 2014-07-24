class MessageScore (Message):
 
    Score:
        get:
            return _score
    _score as int
 
    def constructor (score):
 
        _score = score
 
        # send the message
        super()