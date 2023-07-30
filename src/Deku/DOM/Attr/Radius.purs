module Deku.DOM.Attr.Radius where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Radius = Radius

instance Attr FeMorphology_ Radius String where
  attr Radius bothValues  = unsafeAttribute $ Both { key: "radius", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "radius", value:  prop' value  })
  pureAttr Radius value  = unsafeAttribute $ This { key: "radius", value:  prop' value  }
  unpureAttr Radius eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "radius", value:  prop' value  }

instance Attr everything Radius Unit where
  attr Radius bothValues  = unsafeAttribute $ Both { key: "radius", value:  unset'  } (snd bothValues <#> \_ -> { key: "radius", value:  unset'  })
  pureAttr Radius _  = unsafeAttribute $ This { key: "radius", value:  unset'  }
  unpureAttr Radius eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "radius", value:  unset'  }
