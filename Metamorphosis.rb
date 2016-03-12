# Philip Glass - Metamorphosis I
# Arrangement For Pi by Nick Playfair

# global declaration
s = 1.0/6
dsq=sq=sqd=q=qd=qdd=c=cd=cdd=m=md=mdd=b=bd=wn=1*s
loud = 0.8
medium = 0.7
quiet = 0.4
bar = 0.0

define :setup do |s| #allows timings to be redefined
  dsq = 1 * s
  sq = 2 * s
  sqd = 3 * s
  q = 4 * s
  qd = 6 * s
  qdd = 7 * s
  c = 8 * s
  cd = 12 * s
  cdd = 14 * s
  m = 16 * s
  md = 24 * s
  mdd = 28 * s
  b = 32 * s
  bd = 48 * s
  wn = 64 * s
end

define :tune do|pitch,duration,shift=0,amp= 0.3,ratio = 0.9|
  use_synth :blade
  pitch.zip(duration).each do |p,d|
    if p == :r
      sleep d
    else
      with_transpose shift do
        play p,sustain: ratio*d, release: (1-ratio)*d,attack: 0, amp: amp
        sleep d
      end
    end
  end
end

# Section 1
define :sec1 do
  n1a = [:E3, :E3, :D3, :D3, :C3, :C3, :C3, :C3, :r]
  n1b = [:G3, :G3, :G3, :G3, :G3, :G3, :E3, :E3, :r]
  n1c = [:B4, :B4, :B4, :B4, :B4, :B4, :Bb4, :Bb4, :r]
  n1d = [:E4, :E4, :E4, :E4, :C4, :C4, :C4, :C4, :r]
  n1e = [:G4, :G4, :G4, :G4, :G4, :G4, :E4, :E4, :r]
  n1f = [:B5, :B5, :B5, :B5, :B5, :B5, :Bb5, :Bb5, :r]

  d1a = [c, md, c, md, c, md, c, md, c]
  d1b = [c, md, c, md, c, md, c, md, c]

  in_thread do
    tune(n1a,d1a,0,loud,0.6)
  end
  in_thread do
    tune(n1b,d1a,0,loud,0.6)
  end
  in_thread do
    tune(n1c,d1a,0,loud,0.95)
  end
  in_thread do
    tune(n1d,d1a,0,loud,0.95)
  end
  in_thread do
    tune(n1e,d1a,0,loud,0.95)
  end
  in_thread do
    tune(n1f,d1b,0,loud,0.95)
  end
end

# Section 2 - 4 bars

define :sec2 do
  n2a = [:E3, :E3]
  n2b = [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4]
  n2b.concat [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4]
  n2c = [:r, :E1]
  n2d = [:r, :E2]

  d2a = [wn, wn]
  d2b =      [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]
  d2b.concat [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]
  d2c = [wn,wn]

  in_thread do
    tune(n2a,d2a,0,medium,0.6)
  end
  in_thread do
    tune(n2b,d2b,0,medium,0.95)
  end
  in_thread do
    tune(n2c,d2a,0,medium,0.9)
  end
  in_thread do
    tune(n2d,d2a,0,medium,0.9)
  end
end

# Section 3 - 4 bars

define :sec3 do
  n3a = [:E3, :E3, :D3, :D3, :C3, :C3, :C3, :C3, :r]
  n3b = [:G3, :G3, :G3, :G3, :G3, :G3, :E3, :E3, :r]
  n3c = [:B4, :B4, :B4, :B4, :B4, :B4, :Bb4, :Bb4, :r]
  n3d = [:E4, :E4, :D4, :D4, :C4, :C4, :C4, :C4, :r]
  n3e = [:G4, :G4, :G4, :G4, :G4, :G4, :E4, :E4, :r]
  n3f = [:B5, :B5, :B5, :B5, :B5, :B5, :Bb5, :Bb5, :r]

  d3a = [c,md,c,md,c,md,c,md,c]

  in_thread do
    tune(n3a,d3a,0,medium,0.95)
  end
  in_thread do
    tune(n3b,d3a,0,medium,0.95)
  end
  in_thread do
    tune(n3c,d3a,0,medium,0.95)
  end
  in_thread do
    tune(n3d,d3a,0,medium,0.95)
  end
  in_thread do
    tune(n3e,d3a,0,medium,0.95)
  end
  in_thread do
    tune(n3f,d3a,0,medium,0.5)
  end
end

# Section 4 - 12 bars

define :sec4 do
  n4a = [:E3, :D3, :C3, :Bb3, :E3]
  n4b = [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4]
  n4b.concat [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:Bb4,:G3,:Bb4,:G3,:Bb4,:G3,:Bb4]
  n4b.concat [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4]
  n4e = [:r, :r, :D5, :B5, :r, :D5, :B5, :r, :D5, :B5, :r, :Bb5, :G4]
  n4f = [:r, :r, :D6, :B6, :r, :D6, :B6, :r, :D6, :B6, :r, :Bb6, :G5]

  d4a = [b, b, b, b, b]
  d4b = [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]
  d4b.concat [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]
  d4b.concat [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]
  d4c = [wn,wn ]
  d4e = [c,c,c,m,c,c,m,c,c,m,c,c,m]

  in_thread do
    tune(n4a,d4a,0,medium,0.6)
  end
  in_thread do
    tune(n4b,d4b,0,medium,0.95)
  end
  in_thread do
    tune(n4e,d4e,0,medium,0.6)
  end
  in_thread do
    tune(n4f,d4e,0,medium,0.6)
  end
end

# Section 5

define :sec5 do
  n5a = [:E3]
  n5b = [:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4,:G3,:B4]
  n5c = [:E1]
  n5d = [:E2]

  d2a = [wn]
  d2b = [q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q]


end

## Play
#with_fx :reverb do
s = (1.0/12)
setup(s)
bar = (s * 128)
sec1
sleep bar
sec2
sleep bar
sec3
sleep bar
sec2
sleep bar
sec4
sleep bar

#end