module Deku.DOM.Attr.KeyTimes where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyTimes = KeyTimes

instance Attr Animate_ KeyTimes String where
  attr KeyTimes bothValues  = unsafeAttribute $ Both { key: "keyTimes", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "keyTimes", value:  prop' value  })
  pureAttr KeyTimes value  = unsafeAttribute $ This { key: "keyTimes", value:  prop' value  }
  unpureAttr KeyTimes eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keyTimes", value:  prop' value  }

instance Attr AnimateMotion_ KeyTimes String where
  attr KeyTimes bothValues  = unsafeAttribute $ Both { key: "keyTimes", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "keyTimes", value:  prop' value  })
  pureAttr KeyTimes value  = unsafeAttribute $ This { key: "keyTimes", value:  prop' value  }
  unpureAttr KeyTimes eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keyTimes", value:  prop' value  }

instance Attr AnimateTransform_ KeyTimes String where
  attr KeyTimes bothValues  = unsafeAttribute $ Both { key: "keyTimes", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "keyTimes", value:  prop' value  })
  pureAttr KeyTimes value  = unsafeAttribute $ This { key: "keyTimes", value:  prop' value  }
  unpureAttr KeyTimes eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keyTimes", value:  prop' value  }

instance Attr everything KeyTimes Unit where
  attr KeyTimes bothValues  = unsafeAttribute $ Both { key: "keyTimes", value:  unset'  } (snd bothValues <#> \_ -> { key: "keyTimes", value:  unset'  })
  pureAttr KeyTimes _  = unsafeAttribute $ This { key: "keyTimes", value:  unset'  }
  unpureAttr KeyTimes eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "keyTimes", value:  unset'  }
