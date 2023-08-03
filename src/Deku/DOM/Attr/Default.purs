module Deku.DOM.Attr.Default where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Default = Default

instance Attr Track_ Default (NonEmpty.NonEmpty Event.Event  String ) where
  attr Default bothValues = unsafeAttribute $ Both (pure 
    { key: "default", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "default", value: prop' value })
instance Attr Track_ Default (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Default (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "default", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "default", value: prop' value })
instance Attr Track_ Default  String  where
  attr Default value = unsafeAttribute $ This $ pure $
    { key: "default", value: prop' value }
instance Attr Track_ Default (Event.Event  String ) where
  attr Default eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "default", value: prop' value }

instance Attr Track_ Default (ST.ST Global.Global  String ) where
  attr Default stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "default", value: prop' value }

instance Attr everything Default (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Default bothValues = unsafeAttribute $ Both (pure 
    { key: "default", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "default", value: unset' })
instance Attr everything Default (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Default (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "default", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "default", value: unset' })
instance Attr everything Default  Unit  where
  attr Default _ = unsafeAttribute $ This $ pure $ { key: "default", value: unset' }
instance Attr everything Default (Event.Event  Unit ) where
  attr Default eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "default", value: unset' }

instance Attr everything Default (ST.ST Global.Global  Unit ) where
  attr Default stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "default", value: unset' }
