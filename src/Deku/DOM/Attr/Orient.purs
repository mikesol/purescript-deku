module Deku.DOM.Attr.Orient where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Orient = Orient

instance Attr Marker_ Orient String where
  attr Orient bothValues  = unsafeAttribute $ Both { key: "orient", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "orient", value:  prop' value  })
  pureAttr Orient value  = unsafeAttribute $ This { key: "orient", value:  prop' value  }
  unpureAttr Orient eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "orient", value:  prop' value  }

instance Attr everything Orient Unit where
  attr Orient bothValues  = unsafeAttribute $ Both { key: "orient", value:  unset'  } (snd bothValues <#> \_ -> { key: "orient", value:  unset'  })
  pureAttr Orient _  = unsafeAttribute $ This { key: "orient", value:  unset'  }
  unpureAttr Orient eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "orient", value:  unset'  }
