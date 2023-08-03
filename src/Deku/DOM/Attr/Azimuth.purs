module Deku.DOM.Attr.Azimuth where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Azimuth = Azimuth

instance Attr FeDistantLight_ Azimuth (NonEmpty.NonEmpty Event.Event  String ) where
  attr Azimuth bothValues = unsafeAttribute $ Both (pure 
    { key: "azimuth", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "azimuth", value: prop' value })
instance Attr FeDistantLight_ Azimuth (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Azimuth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "azimuth", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "azimuth", value: prop' value })
instance Attr FeDistantLight_ Azimuth  String  where
  attr Azimuth value = unsafeAttribute $ This $ pure $
    { key: "azimuth", value: prop' value }
instance Attr FeDistantLight_ Azimuth (Event.Event  String ) where
  attr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "azimuth", value: prop' value }

instance Attr FeDistantLight_ Azimuth (ST.ST Global.Global  String ) where
  attr Azimuth stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "azimuth", value: prop' value }

instance Attr everything Azimuth (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Azimuth bothValues = unsafeAttribute $ Both (pure 
    { key: "azimuth", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "azimuth", value: unset' })
instance Attr everything Azimuth (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Azimuth (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "azimuth", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "azimuth", value: unset' })
instance Attr everything Azimuth  Unit  where
  attr Azimuth _ = unsafeAttribute $ This $ pure $ { key: "azimuth", value: unset' }
instance Attr everything Azimuth (Event.Event  Unit ) where
  attr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "azimuth", value: unset' }

instance Attr everything Azimuth (ST.ST Global.Global  Unit ) where
  attr Azimuth stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "azimuth", value: unset' }
