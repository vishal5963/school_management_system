class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # enum role_id: {1=> 'student',2 => 'teacher'}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def students
    self.class.where(teacher_id: id)
  end
end
