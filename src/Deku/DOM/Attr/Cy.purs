module Deku.DOM.Attr.Cy where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cy = Cy

instance Attr Circle_ Cy String where
  attr Cy bothValues  = unsafeAttribute $ Both { key: "cy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "cy", value:  prop' value  })
  pureAttr Cy value  = unsafeAttribute $ This { key: "cy", value:  prop' value  }
  unpureAttr Cy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cy", value:  prop' value  }

instance Attr Ellipse_ Cy String where
  attr Cy bothValues  = unsafeAttribute $ Both { key: "cy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "cy", value:  prop' value  })
  pureAttr Cy value  = unsafeAttribute $ This { key: "cy", value:  prop' value  }
  unpureAttr Cy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cy", value:  prop' value  }

instance Attr RadialGradient_ Cy String where
  attr Cy bothValues  = unsafeAttribute $ Both { key: "cy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "cy", value:  prop' value  })
  pureAttr Cy value  = unsafeAttribute $ This { key: "cy", value:  prop' value  }
  unpureAttr Cy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "cy", value:  prop' value  }

instance Attr everything Cy Unit where
  attr Cy bothValues  = unsafeAttribute $ Both { key: "cy", value:  unset'  } (snd bothValues <#> \_ -> { key: "cy", value:  unset'  })
  pureAttr Cy _  = unsafeAttribute $ This { key: "cy", value:  unset'  }
  unpureAttr Cy eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "cy", value:  unset'  }
