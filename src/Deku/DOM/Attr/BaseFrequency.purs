module Deku.DOM.Attr.BaseFrequency where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency String where
  attr BaseFrequency bothValues  = unsafeAttribute $ Both { key: "baseFrequency", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "baseFrequency", value:  prop' value  })
  pureAttr BaseFrequency value  = unsafeAttribute $ This { key: "baseFrequency", value:  prop' value  }
  unpureAttr BaseFrequency eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "baseFrequency", value:  prop' value  }

instance Attr everything BaseFrequency Unit where
  attr BaseFrequency bothValues  = unsafeAttribute $ Both { key: "baseFrequency", value:  unset'  } (snd bothValues <#> \_ -> { key: "baseFrequency", value:  unset'  })
  pureAttr BaseFrequency _  = unsafeAttribute $ This { key: "baseFrequency", value:  unset'  }
  unpureAttr BaseFrequency eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "baseFrequency", value:  unset'  }
