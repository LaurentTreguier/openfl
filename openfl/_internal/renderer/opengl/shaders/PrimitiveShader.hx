package openfl._internal.renderer.opengl.shaders;


import lime.graphics.opengl.GLProgram;
import lime.graphics.opengl.GLUniformLocation;
import lime.graphics.GLRenderContext;


class PrimitiveShader extends AbstractShader {
	
	
	public var alpha:GLUniformLocation;
	public var offsetVector:GLUniformLocation;
	public var tintColor:GLUniformLocation;
	public var translationMatrix:GLUniformLocation;
	
	
	public function new (gl:GLRenderContext) {
		
		super (gl);
		
		fragmentSrc = [
			#if !desktop
			'precision mediump float;',
			#end
			'varying vec4 vColor;',
			
			'void main(void) {',
			'   gl_FragColor = vColor;',
			'}'
		];
		
		vertexSrc  = [
			'attribute vec2 aVertexPosition;',
			'attribute vec4 aColor;',
			'uniform mat3 translationMatrix;',
			'uniform vec2 projectionVector;',
			'uniform vec2 offsetVector;',
			'uniform float alpha;',
			'uniform vec3 tint;',
			'varying vec4 vColor;',
			
			'void main(void) {',
			'   vec3 v = translationMatrix * vec3(aVertexPosition , 1.0);',
			'   v -= offsetVector.xyx;',
			'   gl_Position = vec4( v.x / projectionVector.x -1.0, v.y / -projectionVector.y + 1.0 , 0.0, 1.0);',
			//'   vColor = aColor * vec4(tint * alpha, alpha);',
			'   vColor = aColor;',
			'}'
		];
		
		init ();
		
	}
	
	
	public override function init ():Void {
		
		super.init ();
		
		var gl = this.gl;
		
		projectionVector = gl.getUniformLocation (program, 'projectionVector');
		offsetVector = gl.getUniformLocation (program, 'offsetVector');
		tintColor = gl.getUniformLocation (program, 'tint');
		
		aVertexPosition = gl.getAttribLocation (program, 'aVertexPosition');
		colorAttribute = gl.getAttribLocation (program, 'aColor');
		
		attributes = [ aVertexPosition, colorAttribute ];
		
		translationMatrix = gl.getUniformLocation (program, 'translationMatrix');
		alpha = gl.getUniformLocation (program, 'alpha');
		
	}
	
	
}