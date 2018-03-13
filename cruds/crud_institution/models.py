from backend import db


class Institution(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(250))
    abbreviation =  db.Column(db.String(20))
    cnpj = db.Column(db.String(18), unique=True)
    address = db.Column(db.String(250))
    current_program_section = db.Column(db.String(6))
    programs = db.relationship('Program')


    def set_fields(self, fields):
        self.name = fields['name']
        self.abbreviation = fields['abbreviation']
        self.cnpj = fields['cnpj']
        self.address = fields['address']
        self.current_program_section = fields['current_program_section']

    def __repr__(self):
        return "insert into IFINSTITUTION (institution_id,institution_name,institution_abbreviation,institution_cnpj, institution_address,institution_current_program_section) values ({0},'{1}','{2}','{3}','{4}','{5}');".format(self.id, self.name, self.abbreviation, self.cnpj, self.address,self.current_program_section)
