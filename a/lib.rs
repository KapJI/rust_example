pub trait SerdeWith<SerdeType> {
    fn deserialize<'a, D: ::serde::Deserializer<'a>>(
        deserializer: D,
    ) -> Result<Self, D::Error>
    where
        Self: Sized;
}

pub struct A {}
