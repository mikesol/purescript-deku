module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel Cb where
  attr OnMousewheel bothValues  = unsafeAttribute $ Both { key: "mousewheel", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mousewheel", value:  cb' value  })
  pureAttr OnMousewheel value  = unsafeAttribute $ This { key: "mousewheel", value:  cb' value  }
  unpureAttr OnMousewheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousewheel", value:  cb' value  }

instance Attr anything OnMousewheel (Effect Unit) where
  attr OnMousewheel bothValues  = unsafeAttribute $ Both { key: "mousewheel", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mousewheel", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMousewheel value  = unsafeAttribute $ This { key: "mousewheel", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMousewheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousewheel", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMousewheel (Effect Boolean) where
  attr OnMousewheel bothValues  = unsafeAttribute $ Both { key: "mousewheel", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mousewheel", value:  cb' (Cb (const value))  })
  pureAttr OnMousewheel value  = unsafeAttribute $ This { key: "mousewheel", value:  cb' (Cb (const value))  }
  unpureAttr OnMousewheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousewheel", value:  cb' (Cb (const value))  }

type OnMousewheelEffect =
  forall element
   . Attr element OnMousewheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousewheel Unit where
  attr OnMousewheel bothValues  = unsafeAttribute $ Both { key: "mousewheel", value:  unset'  } (snd bothValues <#> \_ -> { key: "mousewheel", value:  unset'  })
  pureAttr OnMousewheel _  = unsafeAttribute $ This { key: "mousewheel", value:  unset'  }
  unpureAttr OnMousewheel eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mousewheel", value:  unset'  }
