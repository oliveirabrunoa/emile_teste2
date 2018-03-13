from backend import db


class Program(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    abbreviation = db.Column(db.String(10))
    total_hours = db.Column(db.Integer)
    total_credits = db.Column(db.Integer)
    institution_id = db.Column(db.Integer, db.ForeignKey('institution.id'))
    courses = db.relationship('Courses')
    coordinator_id = db.Column(db.Integer, db.ForeignKey('users.id'))

    def set_fields(self, fields):
        self.name = fields['name']
        self.abbreviation = fields['abbreviation']
        self.total_hours = fields['total_hours']
        self.total_credits = fields['total_credits']
        self.institution_id = fields['institution_id']
        self.coordinator_id = fields['coordinator_id']

    def __repr__(self):
        return "insert into IFPROGRAM (program_id,program_name,program_abbreviation,program_total_hours,program_total_credits,program_institution_id) values ({0},'{1}','{2}',{3},{4});".format(self.id, self.name, self.abbreviation, self.total_hours,self.total_credits,self.institution_id)
