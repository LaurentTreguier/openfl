package openfl.events; #if !flash


import openfl.ui.GameInputDevice;


/**
 * The GameInputEvent class represents an event that is dispatched when a game input device has either been added or removed from the application platform. A game input device also dispatches events when it is turned on or off.
 */
class GameInputEvent extends Event {
	
	
	/**
	 * Indicates that a compatible device has been connected or turned on.
	 */
	public static var DEVICE_ADDED = "deviceAdded";
	
	/**
	 * Indicates that one of the enumerated devices has been disconnected or turned off.
	 */
	public static var DEVICE_REMOVED = "deviceRemoved";
	
	/**
	 * Dispatched when a game input device is connected but is not usable.
	 */
	public static var DEVICE_UNUSABLE = "deviceUnusable";
	
	
	/**
	 * Returns a reference to the device that was added or removed. When a device is added, use this property to get a reference to the new device, instead of enumerating all of the devices to find the new one.
	 */
	public var device (default, null):GameInputDevice;
	
	
	public function new (type:String, bubbles:Bool = true, cancelable:Bool = false, device:GameInputDevice = null) {
		
		super (type, bubbles, cancelable);
		
		this.device = device;
		
	}
	
	
	public override function clone ():Event {
		
		return new GameInputEvent (type, bubbles, cancelable, device);
		
	}
	
	
	public override function toString ():String {
		
		return "[GameInputEvent type=\"" + type + "\" bubbles=" + bubbles + " cancelable=" + cancelable + " device=" + device + "]";
		
	}
	
	
}


#else
typedef GameInputEvent = flash.events.GameInputEvent;
#end