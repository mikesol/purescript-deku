module Deku.DOM.Attr.PatternUnits where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternUnits = PatternUnits

instance Attr Pattern_ PatternUnits String where
  attr PatternUnits bothValues  = unsafeAttribute $ Both { key: "patternUnits", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "patternUnits", value:  prop' value  })
  pureAttr PatternUnits value  = unsafeAttribute $ This { key: "patternUnits", value:  prop' value  }
  unpureAttr PatternUnits eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "patternUnits", value:  prop' value  }

instance Attr everything PatternUnits Unit where
  attr PatternUnits bothValues  = unsafeAttribute $ Both { key: "patternUnits", value:  unset'  } (snd bothValues <#> \_ -> { key: "patternUnits", value:  unset'  })
  pureAttr PatternUnits _  = unsafeAttribute $ This { key: "patternUnits", value:  unset'  }
  unpureAttr PatternUnits eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "patternUnits", value:  unset'  }
