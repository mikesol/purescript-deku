module Deku.DOM.Attr.Fr where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr String where
  attr Fr bothValues  = unsafeAttribute $ Both { key: "fr", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "fr", value:  prop' value  })
  pureAttr Fr value  = unsafeAttribute $ This { key: "fr", value:  prop' value  }
  unpureAttr Fr eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "fr", value:  prop' value  }

instance Attr everything Fr Unit where
  attr Fr bothValues  = unsafeAttribute $ Both { key: "fr", value:  unset'  } (snd bothValues <#> \_ -> { key: "fr", value:  unset'  })
  pureAttr Fr _  = unsafeAttribute $ This { key: "fr", value:  unset'  }
  unpureAttr Fr eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "fr", value:  unset'  }
