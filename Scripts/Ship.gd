extends Area2D

export var linear_speed_max = 300
export var linear_acceleration = 15
export var linear_deceleration = 10
export var rotational_speed = 3

var velocity = Vector2(0, 0)

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		# Get unit vector pointing forward (in front of ship)
		var forward = Vector2.UP.rotated(rotation)
		
		# Accelerate ship forward by constant amount
		velocity += forward * linear_acceleration
		
		# Don't go past max speed
		velocity = velocity.clamped(linear_speed_max)
	else:
		# Check if velocity is greater than deceleration amount
		# to prevent overshooting and causing backward movement
		var decel_squared = linear_deceleration * linear_deceleration
		var velocity_squared = velocity.length_squared()
		if velocity_squared >= decel_squared:
			# Slow ship down by constant amount
			velocity += velocity.normalized() * -linear_deceleration
		else:
			# Stop moving completely
			velocity = Vector2(0, 0)
	
	# Move ship in the direction of ship's velocity
	# scaled by the amount of time since last update
	translate(velocity * delta)
	
	if Input.is_action_pressed("ui_left"):
		# Rotate ship to the left by constant amount
		# scaled by the amount of time since last update
		rotate(-rotational_speed * delta)
	
	if Input.is_action_pressed("ui_right"):
		# Rotate ship to the right by constant amount
		# scaled by the amount of time since last update
		rotate(rotational_speed * delta)