module Deku.DOM.Attr.From where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data From = From

instance Attr Animate_ From String where
  attr From bothValues  = unsafeAttribute $ Both { key: "from", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "from", value:  prop' value  })
  pureAttr From value  = unsafeAttribute $ This { key: "from", value:  prop' value  }
  unpureAttr From eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "from", value:  prop' value  }

instance Attr AnimateMotion_ From String where
  attr From bothValues  = unsafeAttribute $ Both { key: "from", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "from", value:  prop' value  })
  pureAttr From value  = unsafeAttribute $ This { key: "from", value:  prop' value  }
  unpureAttr From eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "from", value:  prop' value  }

instance Attr AnimateTransform_ From String where
  attr From bothValues  = unsafeAttribute $ Both { key: "from", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "from", value:  prop' value  })
  pureAttr From value  = unsafeAttribute $ This { key: "from", value:  prop' value  }
  unpureAttr From eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "from", value:  prop' value  }

instance Attr everything From Unit where
  attr From bothValues  = unsafeAttribute $ Both { key: "from", value:  unset'  } (snd bothValues <#> \_ -> { key: "from", value:  unset'  })
  pureAttr From _  = unsafeAttribute $ This { key: "from", value:  unset'  }
  unpureAttr From eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "from", value:  unset'  }
