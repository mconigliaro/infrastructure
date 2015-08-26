name 'development'
description 'Development environment'
default_attributes(
  # Not supported in VirtualBox
  'mconigliaro_smartmontools' => {
    'enable' => false
  }
)
