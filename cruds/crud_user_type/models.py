from backend import db


class UserType(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(20), unique=True)

    def __repr__(self):
        return "insert into IFUSERTYPE (user_type_id,user_type_description) values ({0},'{1}');".format(self.id, self.name)
  
    def set_fields(self, fields):
        self.name = fields['name']
