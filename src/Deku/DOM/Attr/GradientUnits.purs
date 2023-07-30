module Deku.DOM.Attr.GradientUnits where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits String where
  attr GradientUnits bothValues  = unsafeAttribute $ Both { key: "gradientUnits", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "gradientUnits", value:  prop' value  })
  pureAttr GradientUnits value  = unsafeAttribute $ This { key: "gradientUnits", value:  prop' value  }
  unpureAttr GradientUnits eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "gradientUnits", value:  prop' value  }

instance Attr RadialGradient_ GradientUnits String where
  attr GradientUnits bothValues  = unsafeAttribute $ Both { key: "gradientUnits", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "gradientUnits", value:  prop' value  })
  pureAttr GradientUnits value  = unsafeAttribute $ This { key: "gradientUnits", value:  prop' value  }
  unpureAttr GradientUnits eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "gradientUnits", value:  prop' value  }

instance Attr everything GradientUnits Unit where
  attr GradientUnits bothValues  = unsafeAttribute $ Both { key: "gradientUnits", value:  unset'  } (snd bothValues <#> \_ -> { key: "gradientUnits", value:  unset'  })
  pureAttr GradientUnits _  = unsafeAttribute $ This { key: "gradientUnits", value:  unset'  }
  unpureAttr GradientUnits eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "gradientUnits", value:  unset'  }
