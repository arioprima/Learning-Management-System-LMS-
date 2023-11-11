package entity

import "time"

type User struct {
	UserID    string     `json:"user_id"`
	UserName  string     `json:"user_name"`
	Email     string     `json:"email"`
	Password  string     `json:"password"`
	Role      string     `json:"role"`
	Student   *[]Student `json:"student"`
	Mentor    *[]Mentor  `json:"mentor"`
	Admin     *[]Admin   `json:"admin"`
	IsActive  *bool      `json:"is_active"`
	Verified  *bool      `json:"verified"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
}

type Student struct {
	StudentID  string    `json:"student_id"`
	FirstName  string    `json:"first_name"`
	LastName   *string   `json:"last_name"`
	PlaceBirth string    `json:"place_of_birth"`
	DateBirth  time.Time `json:"date_of_birth"`
	School     string    `json:"school"`
	ClassName  string    `json:"class_name"`
	Address    *string   `json:"address"`
	Phone      *string   `json:"phone"`
	Image      *string   `json:"image"`
	UserId     string    `json:"user_id"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}

type Mentor struct {
	MentorID   string    `json:"mentor_id"`
	FirstName  string    `json:"first_name"`
	LastName   *string   `json:"last_name"`
	PlaceBirth string    `json:"place_of_birth"`
	DateBirth  time.Time `json:"date_of_birth"`
	Address    *string   `json:"address"`
	Phone      *string   `json:"phone"`
	Image      *string   `json:"image"`
	UserId     string    `json:"user_id"`
	CreatedAt  time.Time `json:"created_at"`
	UpdatedAt  time.Time `json:"updated_at"`
}

type Admin struct {
	AdminID   string    `json:"admin_id"`
	FirstName string    `json:"first_name"`
	LastName  *string   `json:"last_name"`
	Image     *string   `json:"image"`
	UserId    string    `json:"user_id"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}
