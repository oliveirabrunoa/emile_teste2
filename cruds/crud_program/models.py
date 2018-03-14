from backend import db


class Program(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    abbreviation = db.Column(db.String(10))
    total_hours = db.Column(db.Integer)
    total_credits = db.Column(db.Integer)
    institution_id = db.Column(db.Integer, db.ForeignKey('institution.id'))
    courses = db.relationship('Courses')

    def set_fields(self, fields):
        self.name = fields['name']
        self.abbreviation = fields['abbreviation']
        self.total_hours = fields['total_hours']
        self.total_credits = fields['total_credits']
        self.institution_id = fields['institution_id']
