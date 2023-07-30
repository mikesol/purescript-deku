module Deku.DOM.Attr.ZoomAndPan where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan String where
  attr ZoomAndPan bothValues  = unsafeAttribute $ Both { key: "zoomAndPan", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "zoomAndPan", value:  prop' value  })
  pureAttr ZoomAndPan value  = unsafeAttribute $ This { key: "zoomAndPan", value:  prop' value  }
  unpureAttr ZoomAndPan eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "zoomAndPan", value:  prop' value  }

instance Attr everything ZoomAndPan Unit where
  attr ZoomAndPan bothValues  = unsafeAttribute $ Both { key: "zoomAndPan", value:  unset'  } (snd bothValues <#> \_ -> { key: "zoomAndPan", value:  unset'  })
  pureAttr ZoomAndPan _  = unsafeAttribute $ This { key: "zoomAndPan", value:  unset'  }
  unpureAttr ZoomAndPan eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "zoomAndPan", value:  unset'  }
