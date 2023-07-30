module Deku.DOM.Attr.GradientTransform where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientTransform = GradientTransform

instance Attr LinearGradient_ GradientTransform String where
  attr GradientTransform bothValues  = unsafeAttribute $ Both { key: "gradientTransform", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "gradientTransform", value:  prop' value  })
  pureAttr GradientTransform value  = unsafeAttribute $ This { key: "gradientTransform", value:  prop' value  }
  unpureAttr GradientTransform eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "gradientTransform", value:  prop' value  }

instance Attr RadialGradient_ GradientTransform String where
  attr GradientTransform bothValues  = unsafeAttribute $ Both { key: "gradientTransform", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "gradientTransform", value:  prop' value  })
  pureAttr GradientTransform value  = unsafeAttribute $ This { key: "gradientTransform", value:  prop' value  }
  unpureAttr GradientTransform eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "gradientTransform", value:  prop' value  }

instance Attr everything GradientTransform Unit where
  attr GradientTransform bothValues  = unsafeAttribute $ Both { key: "gradientTransform", value:  unset'  } (snd bothValues <#> \_ -> { key: "gradientTransform", value:  unset'  })
  pureAttr GradientTransform _  = unsafeAttribute $ This { key: "gradientTransform", value:  unset'  }
  unpureAttr GradientTransform eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "gradientTransform", value:  unset'  }
