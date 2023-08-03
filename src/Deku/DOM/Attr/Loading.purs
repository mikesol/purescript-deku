module Deku.DOM.Attr.Loading where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loading = Loading

instance Attr Img_ Loading (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Img_ Loading (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Loading (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "loading", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Img_ Loading  String  where
  attr Loading value = unsafeAttribute $ This $ pure $
    { key: "loading", value: prop' value }
instance Attr Img_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr Img_ Loading (ST.ST Global.Global  String ) where
  attr Loading stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr Iframe_ Loading (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Iframe_ Loading (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Loading (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "loading", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Iframe_ Loading  String  where
  attr Loading value = unsafeAttribute $ This $ pure $
    { key: "loading", value: prop' value }
instance Attr Iframe_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr Iframe_ Loading (ST.ST Global.Global  String ) where
  attr Loading stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr everything Loading (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loading", value: unset' })
instance Attr everything Loading (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Loading (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "loading", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "loading", value: unset' })
instance Attr everything Loading  Unit  where
  attr Loading _ = unsafeAttribute $ This $ pure $ { key: "loading", value: unset' }
instance Attr everything Loading (Event.Event  Unit ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "loading", value: unset' }

instance Attr everything Loading (ST.ST Global.Global  Unit ) where
  attr Loading stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "loading", value: unset' }
