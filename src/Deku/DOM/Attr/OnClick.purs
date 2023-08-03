module Deku.DOM.Attr.OnClick where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnClick = OnClick

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "click", value: cb' value })
instance Attr anything OnClick (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnClick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "click", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "click", value: cb' value })
instance Attr anything OnClick  Cb  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' value }
instance Attr anything OnClick (Event.Event  Cb ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' value }

instance Attr anything OnClick (ST.ST Global.Global  Cb ) where
  attr OnClick stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "click", value: cb' value }

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnClick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "click", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClick  (Effect Unit)  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClick (Event.Event  (Effect Unit) ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (ST.ST Global.Global  (Effect Unit) ) where
  attr OnClick stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClick (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnClick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "click", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "click", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClick  (Effect Boolean)  where
  attr OnClick value = unsafeAttribute $ This $ pure $
    { key: "click", value: cb' (Cb (const value)) }
instance Attr anything OnClick (Event.Event  (Effect Boolean) ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }

instance Attr anything OnClick (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnClick stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "click", value: cb' (Cb (const value)) }

instance Attr everything OnClick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnClick bothValues = unsafeAttribute $ Both (pure 
    { key: "click", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "click", value: unset' })
instance Attr everything OnClick (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnClick (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "click", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "click", value: unset' })
instance Attr everything OnClick  Unit  where
  attr OnClick _ = unsafeAttribute $ This $ pure $ { key: "click", value: unset' }
instance Attr everything OnClick (Event.Event  Unit ) where
  attr OnClick eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "click", value: unset' }

instance Attr everything OnClick (ST.ST Global.Global  Unit ) where
  attr OnClick stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "click", value: unset' }
