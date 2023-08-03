module Deku.DOM.Attr.ZoomAndPan where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan (NonEmpty.NonEmpty Event.Event  String ) where
  attr ZoomAndPan bothValues = unsafeAttribute $ Both (pure 
    { key: "zoomAndPan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "zoomAndPan", value: prop' value })
instance Attr View_ ZoomAndPan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ZoomAndPan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "zoomAndPan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "zoomAndPan", value: prop' value })
instance Attr View_ ZoomAndPan  String  where
  attr ZoomAndPan value = unsafeAttribute $ This $ pure $
    { key: "zoomAndPan", value: prop' value }
instance Attr View_ ZoomAndPan (Event.Event  String ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "zoomAndPan", value: prop' value }

instance Attr View_ ZoomAndPan (ST.ST Global.Global  String ) where
  attr ZoomAndPan stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "zoomAndPan", value: prop' value }

instance Attr everything ZoomAndPan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ZoomAndPan bothValues = unsafeAttribute $ Both (pure 
    { key: "zoomAndPan", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "zoomAndPan", value: unset' })
instance Attr everything ZoomAndPan (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ZoomAndPan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "zoomAndPan", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "zoomAndPan", value: unset' })
instance Attr everything ZoomAndPan  Unit  where
  attr ZoomAndPan _ = unsafeAttribute $ This $ pure $
    { key: "zoomAndPan", value: unset' }
instance Attr everything ZoomAndPan (Event.Event  Unit ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "zoomAndPan", value: unset' }

instance Attr everything ZoomAndPan (ST.ST Global.Global  Unit ) where
  attr ZoomAndPan stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "zoomAndPan", value: unset' }
