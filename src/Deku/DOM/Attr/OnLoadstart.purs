module Deku.DOM.Attr.OnLoadstart where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart Cb where
  attr OnLoadstart bothValues  = unsafeAttribute $ Both { key: "loadstart", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loadstart", value:  cb' value  })
  pureAttr OnLoadstart value  = unsafeAttribute $ This { key: "loadstart", value:  cb' value  }
  unpureAttr OnLoadstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadstart", value:  cb' value  }

instance Attr anything OnLoadstart (Effect Unit) where
  attr OnLoadstart bothValues  = unsafeAttribute $ Both { key: "loadstart", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "loadstart", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnLoadstart value  = unsafeAttribute $ This { key: "loadstart", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnLoadstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadstart", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnLoadstart (Effect Boolean) where
  attr OnLoadstart bothValues  = unsafeAttribute $ Both { key: "loadstart", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "loadstart", value:  cb' (Cb (const value))  })
  pureAttr OnLoadstart value  = unsafeAttribute $ This { key: "loadstart", value:  cb' (Cb (const value))  }
  unpureAttr OnLoadstart eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loadstart", value:  cb' (Cb (const value))  }

type OnLoadstartEffect =
  forall element
   . Attr element OnLoadstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadstart Unit where
  attr OnLoadstart bothValues  = unsafeAttribute $ Both { key: "loadstart", value:  unset'  } (snd bothValues <#> \_ -> { key: "loadstart", value:  unset'  })
  pureAttr OnLoadstart _  = unsafeAttribute $ This { key: "loadstart", value:  unset'  }
  unpureAttr OnLoadstart eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "loadstart", value:  unset'  }
