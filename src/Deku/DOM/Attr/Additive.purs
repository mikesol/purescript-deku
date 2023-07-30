module Deku.DOM.Attr.Additive where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Additive = Additive

instance Attr Animate_ Additive String where
  attr Additive bothValues  = unsafeAttribute $ Both { key: "additive", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "additive", value:  prop' value  })
  pureAttr Additive value  = unsafeAttribute $ This { key: "additive", value:  prop' value  }
  unpureAttr Additive eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "additive", value:  prop' value  }

instance Attr AnimateMotion_ Additive String where
  attr Additive bothValues  = unsafeAttribute $ Both { key: "additive", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "additive", value:  prop' value  })
  pureAttr Additive value  = unsafeAttribute $ This { key: "additive", value:  prop' value  }
  unpureAttr Additive eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "additive", value:  prop' value  }

instance Attr AnimateTransform_ Additive String where
  attr Additive bothValues  = unsafeAttribute $ Both { key: "additive", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "additive", value:  prop' value  })
  pureAttr Additive value  = unsafeAttribute $ This { key: "additive", value:  prop' value  }
  unpureAttr Additive eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "additive", value:  prop' value  }

instance Attr everything Additive Unit where
  attr Additive bothValues  = unsafeAttribute $ Both { key: "additive", value:  unset'  } (snd bothValues <#> \_ -> { key: "additive", value:  unset'  })
  pureAttr Additive _  = unsafeAttribute $ This { key: "additive", value:  unset'  }
  unpureAttr Additive eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "additive", value:  unset'  }
