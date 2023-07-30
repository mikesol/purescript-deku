module Deku.DOM.Attr.SurfaceScale where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SurfaceScale = SurfaceScale

instance Attr FeDiffuseLighting_ SurfaceScale String where
  attr SurfaceScale bothValues  = unsafeAttribute $ Both { key: "surfaceScale", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "surfaceScale", value:  prop' value  })
  pureAttr SurfaceScale value  = unsafeAttribute $ This { key: "surfaceScale", value:  prop' value  }
  unpureAttr SurfaceScale eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "surfaceScale", value:  prop' value  }

instance Attr FeSpecularLighting_ SurfaceScale String where
  attr SurfaceScale bothValues  = unsafeAttribute $ Both { key: "surfaceScale", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "surfaceScale", value:  prop' value  })
  pureAttr SurfaceScale value  = unsafeAttribute $ This { key: "surfaceScale", value:  prop' value  }
  unpureAttr SurfaceScale eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "surfaceScale", value:  prop' value  }

instance Attr everything SurfaceScale Unit where
  attr SurfaceScale bothValues  = unsafeAttribute $ Both { key: "surfaceScale", value:  unset'  } (snd bothValues <#> \_ -> { key: "surfaceScale", value:  unset'  })
  pureAttr SurfaceScale _  = unsafeAttribute $ This { key: "surfaceScale", value:  unset'  }
  unpureAttr SurfaceScale eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "surfaceScale", value:  unset'  }
