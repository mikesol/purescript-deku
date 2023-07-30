module Deku.DOM.Attr.OnDragstart where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragstart = OnDragstart

instance Attr anything OnDragstart Cb where
  attr OnDragstart bothValues  = unsafeAttribute $ Both { key: "dragstart", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dragstart", value:  cb' value  })
  pureAttr OnDragstart value  = unsafeAttribute $ This { key: "dragstart", value:  cb' value  }
  unpureAttr OnDragstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dragstart", value:  cb' value  }

instance Attr anything OnDragstart (Effect Unit) where
  attr OnDragstart bothValues  = unsafeAttribute $ Both { key: "dragstart", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "dragstart", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnDragstart value  = unsafeAttribute $ This { key: "dragstart", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnDragstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dragstart", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnDragstart (Effect Boolean) where
  attr OnDragstart bothValues  = unsafeAttribute $ Both { key: "dragstart", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "dragstart", value:  cb' (Cb (const value))  })
  pureAttr OnDragstart value  = unsafeAttribute $ This { key: "dragstart", value:  cb' (Cb (const value))  }
  unpureAttr OnDragstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dragstart", value:  cb' (Cb (const value))  }

type OnDragstartEffect =
  forall element
   . Attr element OnDragstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragstart Unit where
  attr OnDragstart bothValues  = unsafeAttribute $ Both { key: "dragstart", value:  unset'  } (snd bothValues <#> \_ -> { key: "dragstart", value:  unset'  })
  pureAttr OnDragstart _  = unsafeAttribute $ This { key: "dragstart", value:  unset'  }
  unpureAttr OnDragstart eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "dragstart", value:  unset'  }
