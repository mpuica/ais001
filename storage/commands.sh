source /opt/ros/jazzy/setup.bash

colcon build --symlink-install

source install/setup.bash

ros2 launch ais001 rsp.launch.py

ros2 run joint_state_publisher_gui joint_state_publisher_gui


--------------------------------------------------

source install/setup.bash

ros2 launch ais001 rsp.launch.py use_sim_time:=true

ros2 param get /robot_state_publisher use_sim_time

ros2 launch ros_gz_sim gz_sim.launch.py

ros2 launch ros_gz_sim gz_spawn_model.launch.py topic:=robot_description entity_name:=ais001

--------------------------------------------------

ros2 run teleop_twist_keyboard teleop_twist_keyboard
